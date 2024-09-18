@extends('layouts.admin')

@section('content')
    <h1>Add Product</h1>
    <form action="{{ route('products.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="product_name">Product Name</label>
            <input type="text" name="product_name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="category_name">Category Name</label>
            <input type="text" name="category_name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="min_price">Min Price</label>
            <input type="number" name="min_price" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="max_price">Max Price</label>
            <input type="number" name="max_price" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea name="description" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label for="delivery_data">Delivery Data</label>
            <input type="text" name="delivery_data" class="form-control">
        </div>
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="number" name="amount" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="image_url">Image URL</label>
            <input type="url" name="image_url" class="form-control">
        </div>
        <div class="form-group">
            <label for="category_id">Category ID</label>
            <input type="number" name="category_id" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Product</button>
    </form>
@endsection