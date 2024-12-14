
{{- define "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.fullname" -}}
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


{{- define "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.labels" -}}
helm.sh/chart: {{ include "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.chart" . }}
{{ include "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd917ec2-6ffa-4a81-8511-f205305612f0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}