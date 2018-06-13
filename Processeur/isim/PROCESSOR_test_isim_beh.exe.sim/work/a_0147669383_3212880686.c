/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/adgonzal/Bureau/b2497/BANC.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);


static void work_a_0147669383_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);

LAB6:    t2 = (t0 + 4440);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t6 = (t0 + 4440);
    *((int *)t6) = 0;
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)3);
    if (t5 != 0)
        goto LAB11;

LAB13:
LAB12:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t3 = *((unsigned char *)t4);
    t5 = (t3 == (unsigned char)2);
    if (t5 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB2;

LAB5:    t4 = (t0 + 2272U);
    t5 = xsi_signal_has_event(t4);
    if (t5 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB10;

LAB11:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t2 = (t0 + 1672U);
    t7 = *((char **)t2);
    t2 = (t0 + 6824U);
    t10 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t7, t2);
    t11 = (t10 - 0);
    t12 = (t11 * 1);
    t13 = (16U * t12);
    t14 = (0U + t13);
    t15 = (t0 + 4552);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t6, 16U);
    xsi_driver_first_trans_delta(t15, t14, 16U, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(61, ng0);
    t2 = xsi_get_transient_memory(256U);
    memset(t2, 0, 256U);
    t6 = t2;
    t12 = (16U * 1U);
    t7 = t6;
    memset(t7, (unsigned char)2, t12);
    t8 = (t12 != 0);
    if (t8 == 1)
        goto LAB17;

LAB18:    t15 = (t0 + 4552);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t2, 256U);
    xsi_driver_first_trans_fast(t15);
    goto LAB15;

LAB17:    t13 = (256U / t12);
    xsi_mem_set_data(t6, t6, t12, t13);
    goto LAB18;

}

static void work_a_0147669383_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t4 = 1;
    if (4U == 4U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 1032U);
    t15 = *((char **)t13);
    t13 = (t0 + 6760U);
    t16 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t15, t13);
    t17 = (t16 - 0);
    t18 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t16);
    t19 = (16U * t18);
    t20 = (0 + t19);
    t21 = (t14 + t20);
    t22 = (t0 + 4616);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t21, 16U);
    xsi_driver_first_trans_fast_port(t22);

LAB2:    t27 = (t0 + 4456);
    *((int *)t27) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t7 = (t0 + 4616);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 4U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t1 = (t2 + t5);
    t6 = (t3 + t5);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_0147669383_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t4 = 1;
    if (4U == 4U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 1192U);
    t15 = *((char **)t13);
    t13 = (t0 + 6776U);
    t16 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t15, t13);
    t17 = (t16 - 0);
    t18 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t16);
    t19 = (16U * t18);
    t20 = (0 + t19);
    t21 = (t14 + t20);
    t22 = (t0 + 4680);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t21, 16U);
    xsi_driver_first_trans_fast_port(t22);

LAB2:    t27 = (t0 + 4472);
    *((int *)t27) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t7 = (t0 + 4680);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 16U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 4U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t1 = (t2 + t5);
    t6 = (t3 + t5);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}


extern void work_a_0147669383_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0147669383_3212880686_p_0,(void *)work_a_0147669383_3212880686_p_1,(void *)work_a_0147669383_3212880686_p_2};
	xsi_register_didat("work_a_0147669383_3212880686", "isim/PROCESSOR_test_isim_beh.exe.sim/work/a_0147669383_3212880686.didat");
	xsi_register_executes(pe);
}
