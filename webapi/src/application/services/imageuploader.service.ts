import { Injectable } from "@nestjs/common";
import { promises as fsPromises } from "fs";
import * as path from 'path';

@Injectable()
export class ImageUploaderService {
  async uploadImage(base64: string, fileName: string): Promise<string> {
    const matches = base64.match(/^data:([A-Za-z-+/]+);base64,(.+)$/);
    if (!matches || matches.length !== 3) {
      throw new Error('Invalid base64 string');
    }

    const fileType = matches[1].split('/')[1];
    const imageData = matches[2];
    const buffer = Buffer.from(imageData, 'base64');
    const filePath = path.join(__dirname, '..', '..', 'resources', `${fileName}.${fileType}`);

    try {
      await fsPromises.mkdir(path.dirname(filePath), { recursive: true }); // Cria o diretório se não existir
      await fsPromises.writeFile(filePath, buffer);
      return `/resources/${fileName}.${fileType}`; // Caminho relativo à pasta 'resources'
    } catch (error) {
      console.error('Failed to save image:', error);
      throw new Error('Failed to save image');
    }
  }
}
