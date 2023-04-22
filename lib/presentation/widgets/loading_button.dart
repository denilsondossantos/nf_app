import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Icon? icon;
  final bool isLoading;
  final bool isDisabled;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? height;
  final double? width;
  const LoadingButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.textStyle,
    this.textColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.0,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: isDisabled ? null : onPressed,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        Theme.of(context).textTheme.button?.copyWith(
                              fontSize: 18.0,
                              color: textColor ??
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                  ),
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: icon!,
                    ),
                ],
              ),
      ),
    );
  }
}
