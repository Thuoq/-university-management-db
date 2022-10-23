/*
  Warnings:

  - Added the required column `knowledgeBlockId` to the `TrainingProgramContent` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TrainingProgramContent" ADD COLUMN     "knowledgeBlockId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "TrainingProgramContent" ADD CONSTRAINT "TrainingProgramContent_knowledgeBlockId_fkey" FOREIGN KEY ("knowledgeBlockId") REFERENCES "KnowledgeBlock"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
