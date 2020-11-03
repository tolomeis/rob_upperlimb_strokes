%computes reconstruction error of firsts fPCs of healthy subjects
%(3R, 7R, 10R)
clear all
if exist('q_stacked_subj') ~= 1
	if exist('loader_subj_dot_mat.mat') == 2
		load('loader_subj_dot_mat.mat');
	else
		loader_subj
	end
end
q_task_warp = q_task_warp_dot;
%% recon calculation 10R

tic
[njoints, nsamples] = size(q_task_warp(1).subject(1).trial(1).q_grad);% number of joints and time length of each signal
nfpc		= 10;	% number of fpcs used
subj_num	= 5;	% number of healthy subjects

%init for efficiency
q_recon_h = zeros(nsamples, njoints);	% reconstruct healthy signal

E = zeros(nfpc,1);			%  
E_h = E;					%
E_subj = zeros(subj_num, nfpc);

 for nsubj = [1 2 3 4 5]%15 %6:24
	disp(['Elaborating subj num ' num2str(nsubj)]);
	
	for k = 1:nfpc % number of used fPCs
		nobs_tmp = size(q_stacked_subj(nsubj).q_matrix_h,1); %number of observation give subject
		err_k = zeros(nobs_tmp,1); % error with k fPCs in time
		for  i = 1:nobs_tmp
			% select the real signal
			q_h = q_stacked_subj(nsubj).q_matrix_h(i,:,:);
			q_h = reshape(q_h, size(q_h,2), size(q_h,3));
			
			% reconstruct with k number of fPCs the selected signal
			for j = 1:njoints
				q_recon_mat = fpca2q(fPCA_subj(nsubj).h_joint(j));
				q_1dof = q_recon_mat(:,i,k+1); % 1joint in time
				q_recon_h(:,j) = q_1dof; 
			end
			q_recon_h = q_recon_h + mean(q_h, 1);

			%rms
% 			err_k(i) = min(rms(q_h - q_recon_h, 2) );
			err_k(i) = norm(rms(q_h - q_recon_h,1) );

		end
		E_h(k) = mean(err_k);
	end
	E_subj(nsubj,:) = E_h;
 end
 E_h_mean10 = mean(E_subj,1);
 E_h_10 = E_subj;

 save('E_h_10','E_h_10_dot');
save('E_h_mean10','E_h_mean10_dot');
 
 %% recon calculation 7R

tic

nsamples = size(q_task_warp(1).subject(1).trial(1).q_grad,1);% number of joints and time length of each signal
njoints		= 7;	% number of joints
nfpc		= 10;	% number of fpcs used
subj_num	= 5;	% number of healthy subjects

%init for efficiency
q_recon_h = zeros(nsamples, njoints);	% reconstruct healthy signal

E = zeros(nfpc,1);			%  
E_h = E;					%
E_subj = zeros(subj_num, nfpc);

 for nsubj = [1 2 3 4 5]%15 %6:24
	disp(['Elaborating subj num ' num2str(nsubj)]);
	
	for k = 1:nfpc % number of used fPCs
		nobs_tmp = size(q_stacked_subj(nsubj).q_matrix_h,1); %number of observation give subject
		err_k = zeros(nobs_tmp,1); % error with k fPCs in time
		for  i = 1:nobs_tmp
			% select the real signal
			q_h = q_stacked_subj(nsubj).q_matrix_h(i,:,:);
			q_h = reshape(q_h, size(q_h,2), size(q_h,3));
			q_h = q_h(:,4:10);
			
			% reconstruct with k number of fPCs the selected signal
			for j = 1:njoints
				jj = j + 3;
				q_recon_mat = fpca2q(fPCA_subj(nsubj).h_joint(jj));
				q_1dof = q_recon_mat(:,i,k+1); % 1joint in time
				q_recon_h(:,j) = q_1dof; 
			end
			q_recon_h = q_recon_h + mean(q_h, 1);

			%rms
% 			err_k(i) = min(rms(q_h - q_recon_h, 2) );
			err_k(i) = norm(rms(q_h - q_recon_h,1) );

		end
		E_h(k) = mean(err_k);
	end
	E_subj(nsubj,:) = E_h;
 end
 E_h_mean7 = mean(E_subj,1);
 E_h_7 = E_subj;
 
save('E_h_7','E_h_7_dot');
save('E_h_mean7','E_h_mean7_dot');
 
 %% recon calculation 3R

tic

nsamples = size(q_task_warp(1).subject(1).trial(1).q_grad,1);%time length of each signal
njoints		= 3;	% number of joints
nfpc		= 10;	% number of fpcs used
subj_num	= 5;	% number of healthy subjects

%init for efficiency
q_recon_h = zeros(nsamples, njoints);	% reconstruct healthy signal

E = zeros(nfpc,1);			%  
E_h = E;					%
E_subj = zeros(subj_num, nfpc);

 for nsubj = [1 2 3 4 5]%15 %6:24
	disp(['Elaborating subj num ' num2str(nsubj)]);
	
	for k = 1:nfpc % number of used fPCs
		nobs_tmp = size(q_stacked_subj(nsubj).q_matrix_h,1); %number of observation give subject
		err_k = zeros(nobs_tmp,1); % error with k fPCs in time
		for  i = 1:nobs_tmp
			% select the real signal
			q_h = q_stacked_subj(nsubj).q_matrix_h(i,:,:);
			q_h = reshape(q_h, size(q_h,2), size(q_h,3));
			q_h = q_h(:,1:3);
			
			% reconstruct with k number of fPCs the selected signal
			for j = 1:njoints
				q_recon_mat = fpca2q(fPCA_subj(nsubj).h_joint(j));
				q_1dof = q_recon_mat(:,i,k+1); % 1joint in time
				q_recon_h(:,j) = q_1dof; 
			end
			q_recon_h = q_recon_h + mean(q_h, 1);

			%rms
% 			err_k(i) = min(rms(q_h - q_recon_h, 2) );
			err_k(i) = norm(rms(q_h - q_recon_h,1) );

		end
		E_h(k) = mean(err_k);
	end
	E_subj(nsubj,:) = E_h;
 end
 E_h_mean3 = mean(E_subj,1);
 E_h_3 = E_subj;
 
save('E_h_3','E_h_3_dot');
save('E_h_mean3','E_h_mean3_dot');