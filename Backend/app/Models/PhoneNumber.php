<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PhoneNumber extends Model
{
    use HasFactory;

    protected $fillable = [
        'card_id',
        'number',
    ];

    public function card()
    {
        return $this->belongsTo(Card::class);
    }
}
