% Adham Khalifa
% Final Project
mainfunction();

function mainfunction()

    %Here's a hashmap to store the letter and its template in a data structure.
    m = containers.Map;
    m('A') = rgb2gray(imread("templates/letters2/a_capital.jpg"));
    m('a') = rgb2gray(imread("templates/letters2/a_small.jpg"));
    m('b') = rgb2gray(imread("templates/letters2/b.jpg"));
    m('c') = rgb2gray(imread("templates/letters2/c.jpg"));
    m('d') = rgb2gray(imread("templates/letters2/d.jpg"));
    m('e') = rgb2gray(imread("templates/letters2/e.jpg"));
    m('f') = rgb2gray(imread("templates/letters2/f.jpg"));
    m('g') = rgb2gray(imread("templates/letters2/g.jpg"));
    m('h') = rgb2gray(imread("templates/letters2/h.jpg"));
    m('i') = rgb2gray(imread("templates/letters2/i.jpg"));
    m('j') = rgb2gray(imread("templates/letters2/j.jpg"));
    m('k') = rgb2gray(imread("templates/letters2/k.jpg"));
    m('l') = rgb2gray(imread("templates/letters2/l.jpg"));
    m('m') = rgb2gray(imread("templates/letters2/m.jpg"));
    m('n') = rgb2gray(imread("templates/letters2/n.jpg"));
    m('o') = rgb2gray(imread("templates/letters2/o.jpg"));
    m('r') = rgb2gray(imread("templates/letters2/r.jpg"));
    m('s') = rgb2gray(imread("templates/letters2/s.jpg"));
    m('t') = rgb2gray(imread("templates/letters2/t.jpg"));
    m('u') = rgb2gray(imread("templates/letters2/u.jpg"));
    m('v') = rgb2gray(imread("templates/letters2/v.jpg"));
    m('w') = rgb2gray(imread("templates/letters2/w.jpg"));
    m('x') = rgb2gray(imread("templates/letters2/x.jpg"));
    m('y') = rgb2gray(imread("templates/letters2/y.jpg"));
    
    %Calling the Braille document
    img1 = rgb2gray(imread("pages/braille2.jpg"));
    
    %A matrix of chars to later lookup using the current value
    target_char = ['A', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' ...
        'l', 'm', 'n', 'o', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y'];
    
    %Looping through the matrix and taking a letter at once and using its corresponding template
    for i = 1:size(target_char, 2)
        hold off;
        img2 = m(target_char(i));
        %Calling template matching function with the temp, document, i counter
        z = TemplateMatching(img1, img2, i);
        %Display the coordinates
        disp(z);
        disp("Press any key to proceed to the next letter");
        pause;
    end



    function x = TemplateMatching(img1, img2, i)

        %Template matching using the threshold to check how much the
        %template matches the current image
        corr = normxcorr2(img2,img1);
        surf(corr), shading flat
        
        %Defining the size of the image
        sizeA = size(img2,1);
        sizeB = size(img2,2);
        t = 0.71; %Setting a threshold
        figure(1)
        imshow(img1); hold on;
        x_values = []; % Store X coordinates
        y_values = []; % Store Y coordinates
            
        %while the images match with at least the value of the threshold
        while max(max(corr)) >= t
            [r,c] = find(ismember(corr,max(max(corr))));
             corr((r - floor((sizeA)/2)):(r + floor((sizeA)/2)),(c-floor((sizeB)/2)):(c+floor((sizeB)/2))) = 0;
             img1((r - floor((sizeA)/2)),(c-floor((sizeB)/2))) = 255; %Change the color of the center pixel
             %Plot a blue dot at that pixel
             plot(c-floor((sizeB)/2),(r - floor((sizeA)/2)),'.','MarkerSize',16, 'MarkerEdgeColor','blue','MarkerFaceColor',[1 .6 .6], 'color', 'r')
             %Write the value of the letter
             text(c-floor((sizeB)/2),(r - floor((sizeA)/2)), target_char(i),'FontSize', 16);
             hold all;
             %update the value of X and Y coordinates
             x_values(i) = c-floor((sizeB)/2);
             y_values(i) = r - floor((sizeA)/2);
        end
         x = [x_values, y_values];
    end
end