<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Score;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class ScoreController extends Controller
{
    
    public function store(Request $request)
    {
        $request->validate([
            'score' => 'required|integer|between:50,500'
        ]);
        $user = Auth::user();
        $today = Carbon::now()->toDateString();

        $scoreCount = Score::where('user_id', $user->id)
            ->whereDate('scored_at', $today)
            ->count();

        if ($scoreCount >= 3) {
            return response()->json(['success' => false, 'message' => 'You can only submit 3 scores per day.']);
        }

        Score::create([
            'user_id' => $user->id,
            'score' => $request->score,
            'scored_at' => Carbon::now()
        ]);
        return response()->json(['success' => true, 'message' => 'Score saved successfully']);
    }

    public function overall()
    {
        $user = Auth::user();

        $userScores = Score::selectRaw('user_id, SUM(score) as total_score')
            ->groupBy('user_id')
            ->orderByDesc('total_score')
            ->get();

        $rank = $userScores->search(fn ($row) => $row->user_id == $user->id) + 1;

        $totalScore = Score::where('user_id', $user->id)->sum('score');

        return response()->json([
            'success' => true,
            'rank' => $rank,
            'totalScore' => $totalScore
        ]);
    }


    public function weekly()
    {
        $user = Auth::user();

        $firstWeekStart = Carbon::create(2025, 3, 28)->startOfDay();  // 28 March 2025
        $now = Carbon::now();

        $weeks = [];
        $weekNo = 1;

        while ($firstWeekStart < $now) {
            $start = $firstWeekStart;
            $end = $firstWeekStart->copy()->addDays(6)->endOfDay();

            //user weekly score
            $userTotal = Score::where('user_id', $user->id)
                ->whereBetween('scored_at', [$start, $end])
                ->sum('score');

            //rank in this week
            $weeklyScores = Score::selectRaw('user_id, SUM(score) as total')
                ->whereBetween('scored_at', [$start, $end])
                ->groupBy('user_id')
                ->orderByDesc('total')
                ->get();

            $rank = $weeklyScores->search(fn ($row) => $row->user_id == $user->id) + 1;

            if ($userTotal > 0) {
                $weeks[] = [
                    'weekNo' => $weekNo,
                    'rank' => $rank,
                    'totalScore' => $userTotal,
                ];
            }

            $firstWeekStart = $firstWeekStart->addDays(7);
            $weekNo++;
        }

        return response()->json([
            'success' => true,
            'weeks' => $weeks
        ]);
    }
}
