/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `Position` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[code]` on the table `Section` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `Position` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `Section` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Position" ADD COLUMN     "code" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Section" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Position_code_key" ON "Position"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Section_code_key" ON "Section"("code");
