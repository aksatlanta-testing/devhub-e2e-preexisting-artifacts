
{{- define "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.fullname" -}}
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


{{- define "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.labels" -}}
helm.sh/chart: {{ include "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.chart" . }}
{{ include "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32f3572a-b1e5-480c-ac70-3176ad924694.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}