# Create a Jekyll container from a Ruby Alpine image

# Step 1: Install the Ruby image
# Check the ruby version on https://pages.github.com/versions/ (here 3.3.4)
FROM ruby:3.3.4-alpine3.20

# # Step 2: Install dependencies
# # RUN apt-get update -qq && \
# #     apt-get install -y build-essential nodejs git
RUN apk add --update gcc g++ make && \
    gem install jekyll bundler minima

WORKDIR "/usr/src/app"

RUN if [ -f "Gemfile" ]; \
    then bundle install; \
    else bundle init && bundle install; \
    fi

# RUN if [! -f "_config.yml" ]; \
#     then jekyll new . --force; \
#     fi

RUN if [ ! -f "_config.yml" ]; then jekyll new . --force; fi

# RUN bundle add webrick && bundle exec jekyll serve
# RUN bundle init && \
#     bundle install && \
#     bundle exec jekyll serve

# # # Update the Ruby bundler and install Jekyll
# # RUN gem update bundler && gem install bundler jekyll


# # Step 3: Set the working directory
# WORKDIR /usr/src/app

# Expose port 4000 to view the website
EXPOSE 4000



# ENTRYPOINT [ "/bin/bash" ]
# ENTRYPOINT [ "date" ]
ENTRYPOINT ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "/bin/bash" ]
# ENTRYPOINT ["/bin/sh"]
# ENTRYPOINT ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch"]
