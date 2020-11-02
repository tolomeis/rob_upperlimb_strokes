%% Script description
% This script computes and plots angle between the subspace generated by the
% selected rPCs and the one generated by the mean_posture PCs.


% posture computed as the mean of each rPC among all subjects.
% It requires the choice of ngroup.


% How we obtained mean_posture PCs? Follow the steps:
% 1.	Mean at each time step between all selected trial for each subject 
%		(njoints x nsample) for each subject.
% 2.	For each subject, we compute the "temporal" mean for each joint 
%		angle. We get a (njoints x 1) for each subject. We lose this way
%		the temporal information
% (3.)	We stack each subject to his own group (h, la, a)
% 3.	We stack together all subjects
% 4.	autovettori = PCA(njoints x subjects)^T
%% intro
clear all; clc;

ngroup = 1;		
%		- ngroup: number between 1, 2 and 3. it selects which group of task
%		we want to analyze. (1 = int, 2 = tr, 3 = tm, 'all' = all tasks)
% load data

flag_mean = 1;
% if flag_mean = 0 mean posture is computed as PCA of mean postures of each
% subject
% if flag_mean = 1 mean posture is computed as MEAN of mean postures of each
% subject

data_rPCA_hsla = rpca_hsla(ngroup);
mean_posture = mean_post(ngroup, flag_mean);
nsamples = size(data_rPCA_hsla.h.var_expl,2);

%% extrapulate angles one at a time

sel_rPC = [1 2 3];
[angles] = rPC_angle_group(data_rPCA_hsla, sel_rPC, mean_posture);

%% plot

%legend msg
legend_msg = [];
for i = 1:length(sel_rPC)
	msg_tmp = ['principal angle ' num2str(i)];
	legend_msg = cat(1, legend_msg, msg_tmp);
end

figure(1)
clf
plot(angles.h')
hold on
plot(vecnorm(angles.h, 2, 1)','k--')
grid on
title(['Subspace angles of Healthy group between span rPCs and span mean PCs'])
legend(legend_msg)
xlim([1 nsamples])
ylim([0 max(vecnorm(angles.h, 2, 1))+3])
xlabel('Time samples')
ylabel('Angle [deg]')

figure(2)
clf
plot(angles.s')
hold on
plot(vecnorm(angles.s, 2, 1)','k--')
grid on
title(['Subspace angles of Stroke group between span rPCs and span mean PCs'])
legend(legend_msg)
xlim([1 nsamples])
ylim([0 max(vecnorm(angles.s, 2, 1))+3])
xlabel('Time samples')
ylabel('Angle [deg]')

figure(3)
clf
plot(angles.la')
hold on
plot(vecnorm(angles.la, 2, 1)','k--')
grid on
title(['Subspace angles of Less Affected group between span rPCs and span mean PCs'])
legend(legend_msg)
xlim([1 nsamples])
ylim([0 max(vecnorm(angles.la, 2, 1))+3])
xlabel('Time samples')
ylabel('Angle [deg]')