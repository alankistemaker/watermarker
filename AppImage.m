classdef AppImage
    properties (Access = private)
        fSizeX
        fSizeY
        fImageMatrix
        fTitle
        fCompTime
    end
    
    methods
        % constructor
        function obj = AppImage(aImage, aTitle, aCompTime)
            lImageMatrix = zeros(1,1);
            lTitle = 'empty';
            lCompTime = 0;
            switch nargin
                case 1
                    % image based constuctor
                    lImageMatrix = aImage;
                case 2
                    % image and title constructor
                    lImageMatrix = aImage;
                    lTitle = aTitle;
                case 3
                    % image, title and time taken to compute
                    lImageMatrix = aImage;
                    lTitle = aTitle;
                    lCompTime = aCompTime;
                otherwise
                    % error
            end
            [obj.fSizeX, obj.fSizeY] = size(lImageMatrix);
            obj.fImageMatrix = lImageMatrix;
            obj.fTitle = lTitle;
            obj.fCompTime = lCompTime;
        end
        
        % operator overloading
        
        % overloaded subratction function
        function result = minus(obj1, obj2)
            a = double(obj1.matrix);
            b = double(obj2.matrix);
            if size(a) == size(b)
                result = a - b;
            else
                result = 0;
                disp('Error: cannot subtract AppImages - matrix sizes incompatible');
            end
        end
        
        % title getter
        function lTitle = title(obj)
            lTitle = obj.fTitle;
        end
        
        % row getter
        function lRows = rows(obj)
            lRows = obj.fSizeY;
        end
        
        % column getter
        function lColumns = columns(obj)
            lColumns = obj.fSizeX;
        end
        
        % image getter
        function lMatrix = matrix(obj)
            lMatrix = obj.fImageMatrix;
        end
        
        % embed aWatermarkImage into obj using aMethod
        function lEmbeddedImage = embed(obj, aWatermarkImage, aMethod)
            lMethod = string(aMethod);
            lHostImage = obj;
            lWatermarkImage = aWatermarkImage;
            
            if strcmp(lMethod, 'SVD')
                % embed using svd
                lEmbeddedImage = SVDEmbedImage(lHostImage, lWatermarkImage);
                
            elseif strcmp(lMethod, 'DCT')
                % embed using dct
                lEmbeddedImage = DCTEmbedImage(lHostImage, lWatermarkImage);
                
            elseif strcmp(lMethod, 'LSB')
                % embed using lsb
                lEmbeddedImage = LSBEmbedImage(lHostImage, lWatermarkImage);
            else
                % construct blank AppImage
                lEmbeddedImage = AppImage;
                disp('Error: AppImage.embed - FAILED: watermarking method is invalid');
            end
            
        end
        
        % returns a string containg the images dimensions 'XxY'
        function lDimensions = dimensions(obj)
            lDimensions = strcat(string(obj.fSizeX), 'x', string(obj.fSizeY));
        end
        
        % displays the image in a new figure
        function figDisplay(obj)
            figure('Name', 'Image'), imshow(obj.matrix, []);
        end
        
        % calls wmRefact and returns a new AppImage tiled to aBlockSize
        function lAppImage = tile(obj, aBlockSize)
            lAppImage = wmRefact(obj.fImageMatrix, aBlockSize);
            lAppImage = AppImage(lAppImage, obj.title);
        end
        
        % calls wmSanitation and returns a new sanitized AppImage
        function lAppImage = makeBinary(obj)
            binImg = wmSanitation(obj.matrix);
            lAppImage = AppImage(binImg, obj.title);
        end
        
        % takes an image and makes it a square (nxn) image where n is a
        % power of 2
        % eg. 2^4 x 2^4 = 8x8
        function lSquareImage = makeSquare(obj, aSize)
            if mod(aSize, 2) ~= 0
                disp('Error: makeSquare - aSize must be a power of 2');
                lSquareImage = AppImage;
            else
                lImage = obj.matrix;
                lSquare = imresize(lImage, [aSize aSize]);
                lSquareImage = AppImage(lSquare, obj.title);
            end
            %             [column, row] = size(lImage);
            %             if (column - row ~= 0)
            %                 % scale column to equal row
            %             elseif (mod(column, 2) ~= 0)
            %                 % at this point we can assume column = row
            %                 mod(column, 2)
            %             end
            
        end
        
        % converts RGB image to grayscale
        function lGrayScaleImage = makeGrayscale(obj)
            converted = rgb2gray(obj.matrix);
            lGrayScaleImage = AppImage(converted, obj.title);
        end
        
        
        
        % attacks
        % jpegAttack returns a new AppImage
        function lCompressedImage = jpegAttack(obj)
            try
                lCompressed = obj.matrix;
                lFilename = strcat('compressed', obj.title, '.jpg');
                imwrite(lCompressed, lFilename, 'Mode', 'lossy', 'Quality', 75);
                lCompressed = imread(lFilename);
            catch
                lCompressed = 0;
                disp('Error: jpegAttack has failed');
            end
            lCompressedImage = AppImage(lCompressed, obj.title);
        end
        
        function lNoisyImage = noiseAttack(obj)
            try
                lNoisy = imnoise(obj.matrix, 'salt & pepper', 0.02);
            catch
                lNoisy = 0;
                disp('Error: noiseAttack has failed');
            end
            lNoisyImage = AppImage(lNoisy, obj.title);
        end
    end
end

