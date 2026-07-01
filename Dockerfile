FROM nginx:alpine

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy nginx config first (cached layer — changes rarely)
COPY nginx.conf /etc/nginx/nginx.conf

# Copy app code (rebuilds when index.html changes)
COPY app/index.html /usr/share/nginx/html/index.html

# Switch to non-root user
USER appuser

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
