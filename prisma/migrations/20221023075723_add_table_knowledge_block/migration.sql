/*
  Warnings:

  - You are about to drop the `KnowedgeBlock` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "KnowedgeBlock" DROP CONSTRAINT "KnowedgeBlock_knowedgeBlockId_fkey";

-- DropTable
DROP TABLE "KnowedgeBlock";

-- CreateTable
CREATE TABLE "KnowledgeBlock" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedDatetime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "KnowledgeBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_KnowledgeBlock" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_KnowledgeBlock_AB_unique" ON "_KnowledgeBlock"("A", "B");

-- CreateIndex
CREATE INDEX "_KnowledgeBlock_B_index" ON "_KnowledgeBlock"("B");

-- AddForeignKey
ALTER TABLE "_KnowledgeBlock" ADD CONSTRAINT "_KnowledgeBlock_A_fkey" FOREIGN KEY ("A") REFERENCES "KnowledgeBlock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_KnowledgeBlock" ADD CONSTRAINT "_KnowledgeBlock_B_fkey" FOREIGN KEY ("B") REFERENCES "KnowledgeBlock"("id") ON DELETE CASCADE ON UPDATE CASCADE;
