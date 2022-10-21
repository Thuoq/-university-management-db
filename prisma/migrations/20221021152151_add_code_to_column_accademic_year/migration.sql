/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `AcademicYear` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `AcademicYear` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AcademicYear" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "AcademicYear_code_key" ON "AcademicYear"("code");
