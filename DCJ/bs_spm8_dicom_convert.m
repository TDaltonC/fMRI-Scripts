clear dataIn dataOut

% List of inputs
%--------------------------------------------------------------------------

% Subject 1
nsubj = 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject1_19851009ARLV_200905060800\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject1_19851009ARLV_200905060800\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject1_19851009ARLV_200905060800\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject1_19851009ARLV_200905060800\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject01\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject01\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject01\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject01\Functional\Run3';

% Subject 2
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject2_19810615ABBN_200905060900\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject2_19810615ABBN_200905060900\dicom\8';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject2_19810615ABBN_200905060900\dicom\10';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject2_19810615ABBN_200905060900\dicom\12';
dataIn{nsubj,5} = 'E:\Data\Jarek\DCJ\MRIData\Subject2_19810615ABBN_200905060900\dicom\14';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject02\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject02\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject02\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject02\Functional\Run3';
dataOut{nsubj,5} = 'E:\Data\Jarek\DCJ\SPM\data\Subject02\Functional\Run4';

% Subject 3
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject3_19860708MRUA_200905061000\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject3_19860708MRUA_200905061000\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject3_19860708MRUA_200905061000\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject3_19860708MRUA_200905061000\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject03\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject03\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject03\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject03\Functional\Run3';

% Subject 4
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject4_19871106MGNA_200905080800\dicom\4';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject4_19871106MGNA_200905080800\dicom\8';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject4_19871106MGNA_200905080800\dicom\10';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject4_19871106MGNA_200905080800\dicom\12';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject04\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject04\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject04\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject04\Functional\Run3';

% Subject 5
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject5_19871029DRNA_200905080900\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject5_19871029DRNA_200905080900\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject5_19871029DRNA_200905080900\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject5_19871029DRNA_200905080900\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject05\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject05\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject05\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject05\Functional\Run3';

% Subject 6
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject6_19841024VRBR_200905120900\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject6_19841024VRBR_200905120900\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject6_19841024VRBR_200905120900\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject6_19841024VRBR_200905120900\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject06\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject06\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject06\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject06\Functional\Run3';

% Subject 7
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject7_19860318LNZN_200905121030\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject7_19860318LNZN_200905121030\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject7_19860318LNZN_200905121030\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject7_19860318LNZN_200905121030\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject07\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject07\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject07\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject07\Functional\Run3';

% Subject 8
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\subject8_19840620EICS_200905121240\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\subject8_19840620EICS_200905121240\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\subject8_19840620EICS_200905121240\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\subject8_19840620EICS_200905121240\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject08\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject08\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject08\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject08\Functional\Run3';

% Subject 9
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject9_19821007LIGC_200905121500\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject9_19821007LIGC_200905121500\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject9_19821007LIGC_200905121500\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject9_19821007LIGC_200905121500\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject09\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject09\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject09\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject09\Functional\Run3';

% Subject 10
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject10_19721117LCBL_200905121600\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject10_19721117LCBL_200905121600\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject10_19721117LCBL_200905121600\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject10_19721117LCBL_200905121600\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject10\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject10\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject10\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject10\Functional\Run3';

% Subject 11
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject11_19810616JRBR_200906100800\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject11_19810616JRBR_200906100800\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject11_19810616JRBR_200906100800\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject11_19810616JRBR_200906100800\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject11\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject11\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject11\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject11\Functional\Run3';

% Subject 12
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject12_19810616HLDO_200906100900\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject12_19810616HLDO_200906100900\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject12_19810616HLDO_200906100900\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject12_19810616HLDO_200906100900\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject12\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject12\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject12\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject12\Functional\Run3';

% Subject 13
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject13_19820331HLFR_200906101000\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject13_19820331HLFR_200906101000\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject13_19820331HLFR_200906101000\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject13_19820331HLFR_200906101000\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject13\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject13\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject13\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject13\Functional\Run3';

% Subject 14
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject14_19781204MRLB_200906150800\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject14_19781204MRLB_200906150800\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject14_19781204MRLB_200906150800\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject14_19781204MRLB_200906150800\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject14\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject14\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject14\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject14\Functional\Run3';

% Subject 15
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject15_19820604LUAV_200906150900\dicom\3';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject15_19820604LUAV_200906150900\dicom\7';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject15_19820604LUAV_200906150900\dicom\9';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject15_19820604LUAV_200906150900\dicom\11';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject15\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject15\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject15\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject15\Functional\Run3';

% Subject 16
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject16_19860612LISM_200906151000\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject16_19860612LISM_200906151000\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject16_19860612LISM_200906151000\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject16_19860612LISM_200906151000\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject16\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject16\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject16\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject16\Functional\Run3';

% Subject 17
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject17_19811104MRDJ_200906220800\dicom\4';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject17_19811104MRDJ_200906220800\dicom\8';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject17_19811104MRDJ_200906220800\dicom\12';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject17_19811104MRDJ_200906220800\dicom\14';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject17\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject17\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject17\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject17\Functional\Run3';

% Subject 18
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject18_19870321AMAE_200906220900\dicom\4';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject18_19870321AMAE_200906220900\dicom\10';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject18_19870321AMAE_200906220900\dicom\14';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject18_19870321AMAE_200906220900\dicom\16';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject18\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject18\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject18\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject18\Functional\Run3';

% Subject 19
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject19_19860221HNSS_200906221000\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject19_19860221HNSS_200906221000\dicom\8';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject19_19860221HNSS_200906221000\dicom\10';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject19_19860221HNSS_200906221000\dicom\15';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject19\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject19\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject19\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject19\Functional\Run3';

% Subject 20
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject20_19880929CCNT_200906301400\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject20_19880929CCNT_200906301400\dicom\6';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject20_19880929CCNT_200906301400\dicom\8';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject20_19880929CCNT_200906301400\dicom\10';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject20\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject20\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject20\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject20\Functional\Run3';

% Subject 21
nsubj = nsubj + 1;
dataIn{nsubj,1} = 'E:\Data\Jarek\DCJ\MRIData\Subject21_19730209SRLT_200906301600\dicom\2';
dataIn{nsubj,2} = 'E:\Data\Jarek\DCJ\MRIData\Subject21_19730209SRLT_200906301600\dicom\8';
dataIn{nsubj,3} = 'E:\Data\Jarek\DCJ\MRIData\Subject21_19730209SRLT_200906301600\dicom\12';
dataIn{nsubj,4} = 'E:\Data\Jarek\DCJ\MRIData\Subject21_19730209SRLT_200906301600\dicom\14';

dataOut{nsubj,1} = 'E:\Data\Jarek\DCJ\SPM\data\Subject21\Anatomical';
dataOut{nsubj,2} = 'E:\Data\Jarek\DCJ\SPM\data\Subject21\Functional\Run1';
dataOut{nsubj,3} = 'E:\Data\Jarek\DCJ\SPM\data\Subject21\Functional\Run2';
dataOut{nsubj,4} = 'E:\Data\Jarek\DCJ\SPM\data\Subject21\Functional\Run3';

% Make jobs
%--------------------------------------------------------------------------
[Nsbj, Nrun] = size(dataIn);

matlabbatch = {};
Njob = 0;
for csbj = 1:Nsbj
    for crun = 1:Nrun
        if ~isempty(dataIn{csbj,crun})
            Njob = Njob + 1;

            % Read dicom files in input directory
            data = spm_select('FPList', dataIn{csbj,crun}, '.*\.dcm$');

            % Create output directory if it doesn't exist
            if ~exist(dataOut{csbj,crun}, 'dir')
                mkdir(dataOut{csbj,crun});
            end

            matlabbatch{Njob}.spm.util.dicom.data = cellstr(data);
            matlabbatch{Njob}.spm.util.dicom.root = 'flat';
            matlabbatch{Njob}.spm.util.dicom.outdir = dataOut(csbj,crun);
            matlabbatch{Njob}.spm.util.dicom.convopts.format = 'img';
            matlabbatch{Njob}.spm.util.dicom.convopts.icedims = 0;
        end
    end
end

% Save batch
%--------------------------------------------------------------------------
save bs_dicom_convert matlabbatch

% Launch batch
%--------------------------------------------------------------------------
spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
