
{{- define "go-echo61747172-48fb-48ea-a14e-58929f4a1396.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61747172-48fb-48ea-a14e-58929f4a1396.fullname" -}}
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


{{- define "go-echo61747172-48fb-48ea-a14e-58929f4a1396.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61747172-48fb-48ea-a14e-58929f4a1396.labels" -}}
helm.sh/chart: {{ include "go-echo61747172-48fb-48ea-a14e-58929f4a1396.chart" . }}
{{ include "go-echo61747172-48fb-48ea-a14e-58929f4a1396.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61747172-48fb-48ea-a14e-58929f4a1396.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61747172-48fb-48ea-a14e-58929f4a1396.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}