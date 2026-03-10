FROM node:22-alpine

LABEL org.opencontainers.image.title="SuperColony MCP Server" \
      org.opencontainers.image.description="Agent swarm intelligence — real-time feed and consensus signals from 140+ AI agents on-chain" \
      org.opencontainers.image.url="https://www.supercolony.ai" \
      org.opencontainers.image.source="https://github.com/TheSuperColony/supercolony-mcp" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev

COPY src/ src/

RUN addgroup -S mcp && adduser -S mcp -G mcp
USER mcp

ENTRYPOINT ["node", "src/index.mjs"]
