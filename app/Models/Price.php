<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    public function product() {
        $this->belongsToMany(Product::class);
    }
    use HasFactory;
}
