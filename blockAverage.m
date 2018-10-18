%% blockAverage takes the cell block created by blocker and averages it out to a single image
function lBlockAverage = blockAverage(aCellBlocks)
lCellBlocks = aCellBlocks;
lBlockAverage = uint8(zeros(64, 64));
numberOfCells = size(lCellBlocks);

for i = 1 : size(lCellBlocks)
    lBlockAverage = lBlockAverage + cell2mat(lCellBlocks(i));
end
lBlockAverage = lBlockAverage/numberOfCells(1);
end