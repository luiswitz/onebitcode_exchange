FROM ruby:2.3-slim
# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
	build-essential nodejs libpq-dev
# Set app path
ENV INSTALL_PATH /usr/src/app
# Create the project folder
RUN mkdir -p $INSTALL_PATH
# Sets the project folder as the main folder
WORKDIR $INSTALL_PATH
# Copy the Gemfile to container
COPY Gemfile ./
# Install the gems
RUN bundle install
# Copy the code to container
COPY . .
# Runs the server
CMD ["rails", "server", "-b", "0.0.0.0"] 
