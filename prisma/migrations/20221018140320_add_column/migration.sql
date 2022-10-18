/*
  Warnings:

  - You are about to drop the column `sectionId` on the `Faculty` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[code]` on the table `Faculty` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `Faculty` table without a default value. This is not possible if the table is not empty.
  - Added the required column `faculityId` to the `Section` table without a default value. This is not possible if the table is not empty.
  - Added the required column `coefficient` to the `Subject` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Faculty" DROP CONSTRAINT "Faculty_sectionId_fkey";

-- AlterTable
ALTER TABLE "Faculty" DROP COLUMN "sectionId",
ADD COLUMN     "code" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "KnowedgeBlock" ADD COLUMN     "knowedgeBlockId" INTEGER;

-- AlterTable
ALTER TABLE "Section" ADD COLUMN     "faculityId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Subject" ADD COLUMN     "coefficient" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Faculty_code_key" ON "Faculty"("code");

-- AddForeignKey
ALTER TABLE "Section" ADD CONSTRAINT "Section_faculityId_fkey" FOREIGN KEY ("faculityId") REFERENCES "Faculty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KnowedgeBlock" ADD CONSTRAINT "KnowedgeBlock_knowedgeBlockId_fkey" FOREIGN KEY ("knowedgeBlockId") REFERENCES "KnowedgeBlock"("id") ON DELETE SET NULL ON UPDATE CASCADE;
