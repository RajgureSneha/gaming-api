<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Score extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'score', 'scored_at'];

    protected $dates = ['scored_at'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
