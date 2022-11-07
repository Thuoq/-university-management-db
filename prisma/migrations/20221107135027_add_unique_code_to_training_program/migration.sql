/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `TrainingProgram` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `TrainingProgram` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TrainingProgram" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "TrainingProgram_code_key" ON "TrainingProgram"("code");
