# Base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev

# Set working directory
WORKDIR /app

# Set environment variables
ENV RAILS_ENV=development
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets (if any)
# RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
