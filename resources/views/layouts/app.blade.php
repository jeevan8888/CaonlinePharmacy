<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <!-- Include your CSS files here -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
</head>
<body>
    <div class="container">
        @include('partials.navbar')

        <!-- Main content -->
        <main>
            @yield('content')
        </main>
    </div>

    <!-- Include your JavaScript files here -->
    <script src="{{ asset('js/app.js') }}"></script>

    <script>
        // Example function to handle form submission with CSRF token
        function submitForm(event) {
            event.preventDefault();

            const formData = new FormData(event.target);

            fetch(event.target.action, {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: formData
            })
            .then(response => response.json())
            .then(data => console.log(data))
            .catch(error => console.error('Error:', error));
        }

        // Attach the submit handler to your form
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('yourFormId');
            if (form) {
                form.addEventListener('submit', submitForm);
            }
        });
    </script>
</body>
</html>