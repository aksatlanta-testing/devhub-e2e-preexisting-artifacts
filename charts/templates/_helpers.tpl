
{{- define "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.fullname" -}}
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


{{- define "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.labels" -}}
helm.sh/chart: {{ include "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.chart" . }}
{{ include "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe002cda1-3759-4686-8eb2-86b3dc6de907.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}