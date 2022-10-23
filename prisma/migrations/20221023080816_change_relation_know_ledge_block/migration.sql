/*
  Warnings:

  - You are about to drop the `_KnowledgeBlock` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_KnowledgeBlock" DROP CONSTRAINT "_KnowledgeBlock_A_fkey";

-- DropForeignKey
ALTER TABLE "_KnowledgeBlock" DROP CONSTRAINT "_KnowledgeBlock_B_fkey";

-- AlterTable
ALTER TABLE "KnowledgeBlock" ADD COLUMN     "knowledgeParentId" INTEGER;

-- DropTable
DROP TABLE "_KnowledgeBlock";

-- AddForeignKey
ALTER TABLE "KnowledgeBlock" ADD CONSTRAINT "KnowledgeBlock_knowledgeParentId_fkey" FOREIGN KEY ("knowledgeParentId") REFERENCES "KnowledgeBlock"("id") ON DELETE SET NULL ON UPDATE CASCADE;
