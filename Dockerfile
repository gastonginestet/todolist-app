# Base image
FROM ruby:3.2-bullseye

# Install dependencies
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y gnupg curl nodejs yarn build-essential libpq-dev watchman

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

RUN chmod +x bin/dev

RUN gem install foreman

# Precompile assets (if any)
# RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Start the Rails server
CMD ["./bin/dev"]
