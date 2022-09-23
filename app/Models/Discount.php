<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{

    public function product() {
        return $this->belongsTo(Product::class);
    }
    use HasFactory;
}
