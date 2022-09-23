<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    public function image() {
        return $this->belongsTo(Image::class);
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function price() {
        return $this->belongsTo(Price::class);
    }

    public function discount() {
        return $this->belongsTo(Discount::class);
    }
    use HasFactory;
}
