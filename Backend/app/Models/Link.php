<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Link extends Model
{
    use HasFactory;

    protected $fillable = [
        'card_id',
        'link',
    ];
    public function card()
    {
        return $this->belongsTo(Card::class);
    }
}
