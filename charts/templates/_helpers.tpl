
{{- define "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.labels" -}}
helm.sh/chart: {{ include "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.chart" . }}
{{ include "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof192b39b-4e86-4a8d-91b8-2ddf6845adb0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}