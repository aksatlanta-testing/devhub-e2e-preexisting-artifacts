
{{- define "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.fullname" -}}
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


{{- define "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.labels" -}}
helm.sh/chart: {{ include "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.chart" . }}
{{ include "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo337289c6-0223-4a5d-b5cd-71a7b19fac0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}