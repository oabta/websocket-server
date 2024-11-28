# Laravel Reverb WebSocket Server

This project install and set up **Laravel Reverb**, a WebSocket server.
Reverb allows you to build real-time, event-driven applications using WebSockets with Laravel, perfect for use cases
like chat applications, live notifications, and more.

## Prerequisites

Before you get started, ensure you have the following installed:

- **Docker engine** >= 27

# Installation

```
git clone https://github.com/oabta/websocket-server.git
cd websocket-server
cp .env.example .env
```

Review `.env` to suit your production requirements.

Then run websocket server:

```
 docker compose up
```
