
function make_movie(Mmov, num_iterations) % Open the video file
    % Open the video file
    vidfile = VideoWriter('AvgFireMap.mp4','MPEG-4');
    open(vidfile);
    for k=1:num_iterations %Looping over all timesteps
    imagesc(Mmov(:,:,k)) % this creates an image of the step k matrix
    F(k) = getframe(gcf);  % this records the image 
    writeVideo(vidfile,F(k));  % this appends it to the video 
    end
    close(vidfile) 
end