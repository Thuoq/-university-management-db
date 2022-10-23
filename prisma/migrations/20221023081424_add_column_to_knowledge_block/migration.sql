/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `KnowledgeBlock` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `KnowledgeBlock` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "KnowledgeBlock" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "KnowledgeBlock_code_key" ON "KnowledgeBlock"("code");
