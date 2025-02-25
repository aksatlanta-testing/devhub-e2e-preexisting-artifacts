
{{- define "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.fullname" -}}
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


{{- define "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.labels" -}}
helm.sh/chart: {{ include "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.chart" . }}
{{ include "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4255bc09-e7e2-4f62-95b4-03d67df80315.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}