
{{- define "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.fullname" -}}
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


{{- define "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.labels" -}}
helm.sh/chart: {{ include "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.chart" . }}
{{ include "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6c9a90c3-54f1-45b7-b528-6b2a31ebf290.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}