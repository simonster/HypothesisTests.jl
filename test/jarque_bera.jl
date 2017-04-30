using HypothesisTests, Base.Test
using HypothesisTests: default_tail

sim_data_h0 = 1.0 .+ [
    0.2972879845354616, 0.3823959677906078, -0.5976344767282311, -0.01044524463737564,
    -0.839026854388764, 0.31111133849833383, 2.2950878238373105, -2.2670863488005306,
    0.5299655761667461, 0.43142152642291204, 0.5837082875687786, 0.9632716050381906,
    0.45879095505371686, -0.5223367574215084, 0.40839583832475224, -0.050451229933665284,
    -0.6936536438038856, -1.7738332534080556, 0.12076596493743928, -0.7576330377205277,
    -1.7297561813906863, 0.7959486220046159, 0.6700619812560624, 0.5508523775007609,
    -0.06337459242956062, 1.3369427822509223, -0.07314863333773934, -0.7454643166407556,
    -1.2200551285346526, -0.05317733752769253, -0.1651363578028337, -2.115370248427311,
    -0.0667679865065892, 1.2224618484680618, 0.5676954597384435, 0.7634989283233873,
    0.37859887985335006, -0.645597056636597, -0.6646462443910314, -1.8030263242108941,
    -1.2890476038497443, -0.3352700795181175, 0.07046760136115796, 0.34179376737982303,
    1.7351656660543822, 1.299915964310192, 0.20636408140261675, -1.0088599555376034,
    -0.8500556703153979, 1.1294094358843267, -1.348533456491827, 1.2402909004290597,
    -0.055647093207324264, 0.7593902139454598, -0.030266886646762546, -0.36108266775609366,
    -2.0073032025325626, -0.5688591273466379, -1.1496275243969976, 1.880622174631185,
    -1.4706245413873802, -0.5352109701657319, -0.9635439598255011, -1.3851080676759138,
    0.13430023756127, -0.6161166660088192, -1.719989356319742, 0.32076927998741056,
    -1.4473728978815112, -0.4922711880695664, -0.4130873839831828, 1.001928512455953,
    1.174681325975111, -1.326970345062047, -1.593214868044067, -0.43870997575879667,
    1.225797497997867, 1.4890902780696147, 2.1594331871008534, -0.9094790180375028,
    1.1478203006125018, -0.5050721965223731, -0.2670670352181297, 1.499082393930729,
    0.7973041601753904, -0.17164044330709693, -0.46907960993009634, 0.21762402120860017,
    0.35914640760234967, 0.3200247157080577, 0.2592163280556861, 0.459695985041628,
    0.20998636004214272, 1.5231753911772645, 1.2597946036121963, -0.16528310111426064,
    0.15619449488763584, -0.8143152943766987, -1.7098682060045913, 1.4999378761140325,
    -0.1289156385300165, -0.4501839715598432
]

t = JarqueBeraTest(sim_data_h0)

@test t.n == 102
@test t.JB ≈ 1.0204197333021678
@test t.skew ≈ -0.020527653857777352
@test t.kurt ≈ 2.5117242352057993
@test pvalue(t) ≈ 0.6003695680393418
@test default_tail(t) == :right
show(IOBuffer(), t)

sim_data_h1 = [
    0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1,
    0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0,
    1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1,
    1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1
]

t = JarqueBeraTest(sim_data_h1)

@test t.n == 102
@test t.JB ≈ 17.00081983024691
@test t.skew ≈ 0.11785113019775637
@test t.kurt ≈ 1.0138888888888888
@test pvalue(t) ≈ 0.00020338498134114293
@test default_tail(t) == :right
show(IOBuffer(), t)
