
{{- define "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.fullname" -}}
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


{{- define "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.labels" -}}
helm.sh/chart: {{ include "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.chart" . }}
{{ include "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo54215ed4-5dcf-4e5e-8448-fad836c3d923.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}