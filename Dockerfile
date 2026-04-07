# Use the official Flutter image as the base image
FROM cirrusci/flutter:stable

# Set the working directory
WORKDIR /app

# Copy the pubspec files
COPY pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the code
COPY . .

# Build the web app
RUN flutter build web --release

# Use nginx to serve the web app
FROM nginx:alpine

COPY --from=0 /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]