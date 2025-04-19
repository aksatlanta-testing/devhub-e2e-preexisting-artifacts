
{{- define "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.fullname" -}}
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


{{- define "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.labels" -}}
helm.sh/chart: {{ include "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.chart" . }}
{{ include "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo27d7e833-05f8-4220-8069-e3d162cd6f7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}