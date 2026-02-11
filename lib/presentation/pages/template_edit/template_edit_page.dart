import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/common/custom_app_bar.dart';
import 'template_edit_view_model.dart';
import '../../../../domain/entities/phase.dart';

class TemplateEditPage extends ConsumerStatefulWidget {
  const TemplateEditPage({super.key});

  @override
  ConsumerState<TemplateEditPage> createState() => _TemplateEditPageState();
}

class _TemplateEditPageState extends ConsumerState<TemplateEditPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(templateEditViewModelProvider);
    final viewModel = ref.read(templateEditViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: '授業内容の編集',
        showBackButton: true,
        actions: [
          TextButton(
            onPressed: () async {
              if (state.currentTotalDuration == 0) {
                 // ...
              }
              final valid = _formKey.currentState!.validate();
              if (valid) {
                 try {
                  await viewModel.saveTemplate();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('テンプレートを保存しました')),
                    );
                    Navigator.of(context).pop();
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('保存に失敗しました: $e')),
                    );
                  }
                }
              }
            },
            child: Text(
              '保存',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24), // Reduced bottom padding
          child: Column(
            children: [
              _buildTemplateNameInput(context, state, viewModel),
              _buildStatsSummary(context, state),
              _buildAutoAdjustToggle(context, state, viewModel),
              _buildSectionHeader(context),
              _buildSegmentList(context, state.phases, viewModel),
              _buildAddSectionButton(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateNameInput(
    BuildContext context,
    TemplateEditState state,
    TemplateEditViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: TextFormField(
        initialValue: state.templateName,
        decoration: InputDecoration(
          labelText: 'テンプレート名',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'テンプレート名を入力してください';
          }
          return null;
        },
        onChanged: viewModel.updateTemplateName,
      ),
    );
  }

  Widget _buildStatsSummary(BuildContext context, TemplateEditState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              context,
              '合計時間',
              state.currentTotalDuration.toString(),
              '分',
            ),
          ),
          // Removed Remaining Time card as requested
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    String unit, {
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: valueColor ?? Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAutoAdjustToggle(
    BuildContext context,
    TemplateEditState state,
    TemplateEditViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '残りの時間を自動調整する',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '1つの時間を変更すると他を自動で調整します',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              key: const Key('autoAdjustSwitch'),
              value: state.autoAdjustEnabled,
              onChanged: (value) => viewModel.toggleAutoAdjust(),
              activeColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '構成要素（長押しで順序変更）',
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentList(
    BuildContext context,
    List<Phase> phases,
    TemplateEditViewModel viewModel,
  ) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      itemCount: phases.length,
      onReorder: (oldIndex, newIndex) {
        viewModel.reorderPhases(oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final phase = phases[index];
        return SegmentItem(
          key: ValueKey(phase.id),
          phase: phase,
          index: index,
          viewModel: viewModel,
        );
      },
      proxyDecorator: (child, index, animation) {
        return Material(
          elevation: 4,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: child,
        );
      },
    );
  }

  Widget _buildAddSectionButton(BuildContext context, TemplateEditViewModel viewModel) {
    // ... (rest of the file content for buildAddSectionButton)
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: viewModel.addPhase,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
              style: BorderStyle.none,
            ),
          ),
          child: CustomPaint(
            painter: _DashedBorderPainter(
              color: Theme.of(context).dividerColor,
              strokeWidth: 2,
              gap: 4,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: Theme.of(context).hintColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'セクションを追加',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SegmentItem extends StatefulWidget {
  final Phase phase;
  final int index;
  final TemplateEditViewModel viewModel;

  const SegmentItem({
    super.key,
    required this.phase,
    required this.index,
    required this.viewModel,
  });

  @override
  State<SegmentItem> createState() => _SegmentItemState();
}

class _SegmentItemState extends State<SegmentItem> {
  late TextEditingController _titleController;
  late TextEditingController _durationController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.phase.title);
    _durationController = TextEditingController(text: widget.phase.durationMinutes.toString());
  }

  @override
  void didUpdateWidget(covariant SegmentItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // For duration: Update if the value in the model differs from the text field
    // (e.g. updated via +/- buttons).
    final currentDuration = int.tryParse(_durationController.text);
    if (currentDuration != widget.phase.durationMinutes) {
        // Double check string representation to avoid unnecessary updates (e.g. "05" vs "5")
        if (_durationController.text != widget.phase.durationMinutes.toString()) {
           // Schedule the update to avoid potential build-phase synchronous inconsistencies
           WidgetsBinding.instance.addPostFrameCallback((_) {
             if (mounted) {
               _durationController.text = widget.phase.durationMinutes.toString();
             }
           });
        }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            ReorderableDragStartListener(
              index: widget.index,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.drag_indicator,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration.collapsed(
                  hintText: 'セクション名の追加',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (value) => widget.viewModel.updatePhaseTitle(widget.phase.id, value),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIconButton(
                    context,
                    Icons.remove,
                    () => widget.viewModel.updatePhaseDuration(
                      widget.phase.id,
                      widget.phase.durationMinutes - 1,
                    ),
                  ),
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: TextFormField(
                        controller: _durationController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                          border: InputBorder.none,
                          suffixText: '分',
                          suffixStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                           final duration = int.tryParse(value);
                           if (duration != null) {
                             widget.viewModel.updatePhaseDuration(widget.phase.id, duration);
                           }
                        },
                      ),
                    ),
                  ),
                  _buildIconButton(
                    context,
                    Icons.add,
                    () => widget.viewModel.updatePhaseDuration(
                      widget.phase.id,
                      widget.phase.durationMinutes + 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => widget.viewModel.removePhase(widget.phase.id),
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 16,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }


}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.gap = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(12),
        ),
      );

    // Simple dashed path implementation
    // For a complex shape like RRect, path metrics is easiest but might be overkill.
    // Let's use a simpler approach or a library if needed, but for now standard border is fine if this fails.
    // Actually, let's just draw a standard border with dash effect using PathMetrics.
    
    // For simplicity in this iteration, I'll draw a solid border if dash is too complex or just create a dashed rect helper.
    // Let's rely on standard dashed border logic:
    
    var metrics = path.computeMetrics();
    for (var metric in metrics) {
      var distance = 0.0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + 5),
          paint,
        );
        distance += 5 + gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        gap != oldDelegate.gap;
  }
}
