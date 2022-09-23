<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RegistrationController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/login', [LoginController::class, 'tryLogin'])->name('tryLogin');
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

Route::group(['middleware' => 'isAuth', 'isAdmin'], function() {
    Route::get('/admin', [\App\Http\Controllers\AdminController::class, 'index'])->name('adminPanel');
    Route::delete('deleteProduct', [\App\Http\Controllers\ProductController::class, 'tryDeleteProduct']);
    Route::post('createProduct', [\App\Http\Controllers\AdminController::class, 'tryCreateNewProduct']);
    Route::post('editProduct', [\App\Http\Controllers\AdminController::class, 'editProduct']);
    Route::post('getCategories', [\App\Http\Controllers\AdminController::class, 'getCategories']);
    Route::delete('deleteCategory', [\App\Http\Controllers\AdminController::class, 'deleteCategory']);
    Route::post('createCategory', [\App\Http\Controllers\AdminController::class, 'createCategory']);
    Route::post('editCategory', [\App\Http\Controllers\AdminController::class, 'editCategory']);
    Route::post('getUsers', [\App\Http\Controllers\AdminController::class, 'getUsers']);
    Route::delete('deleteUser', [\App\Http\Controllers\AdminController::class, 'deleteUser']);
    Route::post('getDiscounts', [\App\Http\Controllers\AdminController::class, 'getDiscounts']);
    Route::delete('deleteDiscount', [\App\Http\Controllers\AdminController::class, 'tryDeleteDiscount']);
    Route::post('createDiscount', [\App\Http\Controllers\AdminController::class, 'createDiscount']);
    Route::post('editDiscount', [\App\Http\Controllers\AdminController::class, 'editDiscount']);
});

Route::get('/register', [RegistrationController::class, 'index'])->name('register');
Route::post('/register', [RegistrationController::class, 'tryRegister'])->name('tryRegister');

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/profile', [UserController::class, 'index'])->name('profile')->middleware('isAuth');

Route::get('/error', [\App\Http\Controllers\ErrorController::class, 'index'])->name('error');

Route::post('/products', [\App\Http\Controllers\ProductController::class, 'filteredProducts'])->name('getProducts');

Route::get('/product/{id}', [\App\Http\Controllers\ProductController::class, 'index'])->name('singleProduct');

Route::get('/author', [HomeController::class, 'author'])->name('author');

Route::get('/cart', [\App\Http\Controllers\CartController::class, 'index'])->name('cart');
Route::post('/getProductsByIds', [\App\Http\Controllers\ProductController::class, 'productsByIds']);
Route::post('/receipt', [\App\Http\Controllers\PurchaseController::class, 'createPurchase']);
Route::post('/contact', [UserController::class, 'insertContact']);

