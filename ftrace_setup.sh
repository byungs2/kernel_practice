#!/bin/bash

echo 0 > /sys/kernel/debug/tracing/tracing_on
sleep 1
echo "tracing off"

echo 0 > /sys/kernel/debug/tracing/events/enable
sleep 1
echo "events disabled"

echo secondary_start_kernel > /sys/kernel/debug/tracing/set_ftrace_filter
sleep 1
echo "set ftrace filter init"

echo function > /sys/kernel/debug/tracing/current_tracer
sleep 1
echo "function traced enabled"

echo $1 > /sys/kernel/debug/tracing/set_ftrace_filter
sleep 1
echo "set ftrace filter enabled"

echo 1 > /sys/kernel/debug/tracing/events/irq/irq_handler_entry/enable
echo 1 > /sys/kernel/debug/tracing/events/irq/irq_handler_exit/enable
echo "events enabled"

echo 1 > /sys/kernel/debug/tracing/options/func_stack_trace
echo 1 > /sys/kernel/debug/tracing/options/sym-offset
echo "function stack trace enabled"

echo 1 > /sys/kernel/debug/tracing/tracing_on
echo "tracing_on"
