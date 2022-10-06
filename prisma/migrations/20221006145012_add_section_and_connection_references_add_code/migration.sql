/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `Major` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[code]` on the table `Subject` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sectionId` to the `Faculty` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `Major` table without a default value. This is not possible if the table is not empty.
  - Added the required column `facultyId` to the `Major` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sectionId` to the `Major` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `Subject` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "TrainingProgram_marjorId_key";

-- AlterTable
ALTER TABLE "Faculty" ADD COLUMN     "sectionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Major" ADD COLUMN     "code" TEXT NOT NULL,
ADD COLUMN     "facultyId" INTEGER NOT NULL,
ADD COLUMN     "sectionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Subject" ADD COLUMN     "code" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "Section" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Section_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Major_code_key" ON "Major"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Subject_code_key" ON "Subject"("code");

-- AddForeignKey
ALTER TABLE "Faculty" ADD CONSTRAINT "Faculty_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "Section"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Major" ADD CONSTRAINT "Major_facultyId_fkey" FOREIGN KEY ("facultyId") REFERENCES "Faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Major" ADD CONSTRAINT "Major_sectionId_fkey" FOREIGN KEY ("sectionId") REFERENCES "Section"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
