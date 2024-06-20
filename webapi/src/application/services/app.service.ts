import { Controller, Get, Header, Injectable } from '@nestjs/common';
@Controller()
export class AppService {
  @Get()
  @Header('Content-Type', 'text/html')
  getHello(): string {
    return `
      <!DOCTYPE html>
      <html>
      <head>
        <title>My HTML Content</title>
      </head>
      <body>
        <h1>Hello, NestJS!</h1>
        <p>Welcome to our API.</p>
      </body>
      </html>
    `;
  }
}
