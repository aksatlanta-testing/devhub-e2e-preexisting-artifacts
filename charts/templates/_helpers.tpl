
{{- define "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.fullname" -}}
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


{{- define "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.labels" -}}
helm.sh/chart: {{ include "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.chart" . }}
{{ include "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8df3d444-f45e-45c4-8dd6-e64144da742f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}