@extends('layouts.layout')

@section('title')
    Clocky shop - Home
@endsection
@section('description') Home page for clocky shop. @endsection

@section('main')

<div class="container">
    <div class="row text-lg-center top-gap bottom-gap">
        <h1>Clocky shop</h1>
        <h3>One stop shop for all your clock needs</h3>
    </div>
    <div class="row">
        <div class="filters col-2">
        <form action="">
            @csrf
            <div>

        @foreach($categories as $category)
            <div class="form-check">
                <input type="checkbox" class="form-check-input category" id="{{ $category->id }}" value="{{ $category->id }}">
                <label for="{{ $category->id }}" class="form-check-label">{{ ucfirst($category->name) }}</label>
            </div>
        @endforeach
            </div>
            <div class="form-group">
                <label for="sort">Sort by price</label>
                <select name="sort-type" id="sort" class="form-select">
                    <option value="default">Order by price</option>
                    <option value="asc">Ascending</option>
                    <option value="desc">Descending</option>
                </select>
            </div>
            <div class="form-group">
                <label for="search">Search</label>
                <input type="text" id="search" name="search">
            </div>
{{--            <label for="customRange1" class="form-label">Example range</label>--}}
{{--            <input type="range" class="form-range" id="customRange1">--}}
        </form>
        </div>

        <div class="col-8" id="products">
            <div class="row">
                @foreach($products as $product)
                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="bg-white rounded shadow-sm">
                            <img src="{{ asset('assets/images/'.$product->image->url) }}" alt="{{ $product->image->alt }}" class="img-fluid card-img-top">
                            <div class="p-4">
                                <h6 class="product-card"> <a href="{{ route('singleProduct', $product->id) }}" class="">{{ $product->name }}</a></h6>
                                <div class="row">
                                    @if($product->discount)
                                    <div class="col-6">
                                        <s class="price text-nowrap">{{ $product->price->amount }} &euro;</s>
                                    </div>
                                    <div class="col-6">
                                        <p class="price text-nowrap">{{ $product->price->amount - (($product->price->amount / 100) * $product->discount->percent) }} &euro;</p>
                                    </div>
                                    @else
                                        <div class="col-6">
                                            <p class="price text-nowrap">{{ $product->price->amount }} &euro;</p>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
                {{ $product->links }}
            </div>
        </div>
    </div>

    </div>
<div class="container-fluid">
    <div class="row bg-dark text-info text-center">
        <h2>Email Enquiry Form</h2>
        <h6>Fill out this form to email us your enquiry</h6>
    </div>
    <div class="row bg-dark justify-content-center">
        <div class="col-5">
            <form>
                <div class="form-group text-info">
                    <label for="contact-form-email">Email</label>
                    <input type="email" class="form-control" name="user-email" id="contact-form-email">
                </div>
                <div class="form-group text-info">
                    <label for="message">Message</label>
                    <textarea name="message" id="message" cols="30" rows="10" class="form-control"></textarea>
                    <span class="hidden bg-dark text-warning" id="contact-form-message"></span>
                </div>
                <label for="submit-contact-form"></label>
                <div class="btn btn-primary form-control" id="submit-contact-form">Submit</div>
            </form>
        </div>
    </div>
</div>
@endsection

{{--<div class="product p-3">--}}
{{--    <img src="{{ asset('assets/images/'.$product->image->url) }}" alt="{{ $product->image->alt }}">--}}
{{--    <p>{{ $product->name }}</p>--}}
{{--</div>--}}
