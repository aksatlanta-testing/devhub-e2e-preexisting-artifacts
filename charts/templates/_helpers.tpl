
{{- define "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.fullname" -}}
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


{{- define "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.labels" -}}
helm.sh/chart: {{ include "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.chart" . }}
{{ include "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15c67bac-d0e1-4e41-934f-d2d440434894.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}