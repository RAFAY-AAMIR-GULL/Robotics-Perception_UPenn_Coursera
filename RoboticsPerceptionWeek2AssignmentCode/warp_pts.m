function [ warped_pts ] = warp_pts( video_pts, logo_pts, sample_pts)
% warp_pts computes the homography that warps the points inside
% video_pts to those inside logo_pts. It then uses this
% homography to warp the points in sample_pts to points in the logo
% image
% Inputs:
%     video_pts: a 4x2 matrix of (x,y) coordinates of corners in the
%         video frame
%     logo_pts: a 4x2 matrix of (x,y) coordinates of corners in
%         the logo image
%     sample_pts: a nx2 matrix of (x,y) coordinates of points in the video
%         video that need to be warped to corresponding points in the
%         logo image
% Outputs:
%     warped_pts: a nx2 matrix of (x,y) coordinates of points obtained
%         after warping the sample_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% Complete est_homography first!
[ H ] = est_homography(video_pts, logo_pts);

% YOUR CODE HERE

warped_pts = [];

len = length(sample_pts);
homogenous_sample_points = [sample_pts, ones(len, 1)];
homogeneous_warped_pts = (H * homogenous_sample_points')';
divider = repmat(homogeneous_warped_pts(:, end), [1, 3]);
homogeneous_warped_pts = homogeneous_warped_pts ./ divider;
warped_pts = homogeneous_warped_pts(:, 1:end-1);

end

