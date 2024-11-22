
{{- define "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.fullname" -}}
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


{{- define "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.labels" -}}
helm.sh/chart: {{ include "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.chart" . }}
{{ include "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof404d970-59ed-4085-adb4-4ae5b0d6fdab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}